import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/providers.dart';

class CustomForm extends StatefulWidget {
  const CustomForm({
    super.key,
    required this.action,
    required this.hintText,
    this.taskTitle,
  });

  final String action;
  final String hintText;
  final String? taskTitle;

  @override
  State<CustomForm> createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  final _formKey = GlobalKey<FormState>();
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: _controller,
            decoration: InputDecoration(
              hintText: widget.hintText,
              suffixIcon: IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () => _controller.clear(),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: (Colors.blue[500])!,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 2.25,
                  color: (Colors.blue[500])!,
                ),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter some text";
              }
              return null;
            },
          ),
          const SizedBox(
            height: 10.0,
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                // ScaffoldMessenger.of(context).showSnackBar(
                //   const SnackBar(content: Text('Processing data...')),
                // );
                // cleaning TextFormField
                if (widget.action == "submit") {
                  context.read<Tasks>().add(_controller.text);
                } else if (widget.action == "edit") {
                  context
                      .read<Tasks>()
                      .edit(widget.taskTitle, _controller.text);
                  // Navigator.pop(context);
                }

                _controller.clear();
              }
            },
            child: Text(widget.action.toUpperCase()),
          ),
        ],
      ),
    );
  }
}
