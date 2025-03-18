
class ProfileResponseEntities {
  final String? name;
  final String? role;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? avatar;
  final List<AssignedRoleEntities>? assignedRoles;

  ProfileResponseEntities({
    this.name,
    this.role,
    this.email,
    this.firstName,
    this.lastName,
    this.avatar,
    this.assignedRoles,
  });}



class AssignedRoleEntities {
  final String? title;
  final String? group;
  final String? manager;
  final String? avatar;

  AssignedRoleEntities({
    this.title,
    this.group,
    this.manager,
    this.avatar,
  });}