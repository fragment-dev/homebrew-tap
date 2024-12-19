require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5923.0.0-darwin-x64.tar.gz"
    sha256 "7a0cfc4ec54d99ca7378c368e3bd0043582774bfa1d36c67aa8452f2c79e5432"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5923.0.0-darwin-arm64.tar.gz"
      sha256 "1d5266ea97b6c105de9e0a09e247ebd00d582548625ecd04e420b8a15f40e322"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5923.0.0-linux-x64.tar.gz"
    sha256 "a5729bb15153b878ec2bb100ca667874b34b6baba09deb28b4372fa875646455"
  end
  version "5923.0.0"
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
