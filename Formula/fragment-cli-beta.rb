require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5170.0.0-darwin-x64.tar.gz"
    sha256 "7a74009f3c58191651dd26b3f58bf13444fd23f2a23bb4ef7dc5eb8c3d19d746"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5170.0.0-darwin-arm64.tar.gz"
      sha256 "b1d551c23e77f1156a35cf27e2d2ea677ba1bcb3cdce911b39d41213c3bb9a18"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5170.0.0-linux-x64.tar.gz"
    sha256 "1343e9144beb731ea4ed8b775769ceeac5a7a710286bb0579db2d230bc14efb3"
  end
  version "5170.0.0"
  license "MIT"
  depends_on "node@20"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
