import 'package:flutter/material.dart';
import '../../config/app_color.dart';
import '../../config/pref.dart';

class editProfilePage extends StatefulWidget {
  editProfilePage({super.key});

  @override
  State<editProfilePage> createState() => _editProfilePageState();
}

class _editProfilePageState extends State<editProfilePage> {
  bool isLoading = false, enableButton = false, btnUpdateProfile = false;
  final Session _session = Session();
  final TextEditingController namaController = TextEditingController(),
      noTelpController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void changeEnableButton(setState) {
    setState(() {
      enableButton = true;
    });
  }

  @override
  void initState() {
    // getUserProfile();
    super.initState();
  }

  @override
  void dispose() {
    namaController.dispose();
    noTelpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: const Color(0xff94A8BE),
        elevation: 0.2,
        backgroundColor: AppColor.white,
        title: Text(
          "Ubah Profil",
          style: fontTextStyle.copyWith(
              color: AppColor.black, fontSize: 18, fontWeight: FontWeight.w500),
        ),
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 16,
            )),
      ),
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 80),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16)),
              // gradient: LinearGradient(
              //   colors: [Color(0xffA78A50), Color(0xff8C6D42)],
              // ),
              color: AppColor.colorPrimaryBlue,
            ),
            width: double.infinity,
            height: 148,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).padding.top + 48),
                    TextFormField(
                      controller: namaController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        fillColor: AppColor.white,
                        filled: true,
                        labelStyle: fontTextStyle.copyWith(
                            color: const Color(0xff878E97)),
                        hintStyle: fontTextStyle.copyWith(
                            color: const Color(0xff878E97)),
                        hintText: "Nama Lengkap",
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide:
                              const BorderSide(color: Color(0xFFE8EDF1)),
                        ),
                        enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFE8EDF1)),
                            borderRadius:
                                BorderRadius.all(Radius.circular(16))),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFE8EDF1)),
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                        ),
                      ),
                      onChanged: (value) {},
                    ),
                    const SizedBox(height: 16),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: noTelpController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        fillColor: AppColor.white,
                        filled: true,
                        labelStyle: fontTextStyle.copyWith(
                            color: const Color(0xff878E97)),
                        hintStyle: fontTextStyle.copyWith(
                            color: const Color(0xff878E97)),
                        hintText: "No Telepon",
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide:
                              const BorderSide(color: Color(0xFFE8EDF1)),
                        ),
                        enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFE8EDF1)),
                            borderRadius:
                                BorderRadius.all(Radius.circular(16))),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFE8EDF1)),
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                        ),
                      ),
                      onChanged: (value) {},
                    ),
                    const SizedBox(height: 16),
                    Container(
                      width: double.infinity,
                      height: 40,
                      decoration: BoxDecoration(
                          color: btnUpdateProfile
                              ? AppColor.colorPrimaryBlue
                              : Colors.grey,
                          borderRadius: BorderRadius.circular(10)),
                      child: btnUpdateProfile
                          ? TextButton(
                              onPressed: () {},
                              child: Text("Simpan",
                                  style: fontTextStyle.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: AppColor.white,
                                  )),
                            )
                          : TextButton(
                              onPressed: () {},
                              child: Text("Simpan",
                                  style: fontTextStyle.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: AppColor.white,
                                  )),
                            ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
