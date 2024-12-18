require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5917.0.0-darwin-x64.tar.gz"
    sha256 "0a11dcf6573246679d276d0129c0e43b2caf267e094d863ae0af2acfd9e15d11"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5917.0.0-darwin-arm64.tar.gz"
      sha256 "a5fd1ab76de35ecfd95d61415beb0de3d24398c72968fcf7f1ee68a1dbc7ac69"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5917.0.0-linux-x64.tar.gz"
    sha256 "f12dacc0fe45d92de4cb431b36eafb80be8d242262af727128cd6a8f3997068a"
  end
  version "5917.0.0"
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
