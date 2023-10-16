require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3835.0.0-darwin-x64.tar.gz"
    sha256 "7b461042b924d66c1384022e73d7aa1e8207b311f647f2620101c8755742eaec"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3835.0.0-darwin-arm64.tar.gz"
      sha256 "d9ea67416705c7b36da61410bac592aa726d5ae288ee1ef9c0cb182dacda9547"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3835.0.0-linux-x64.tar.gz"
    sha256 "23ae8009b2133c44509c8b11236e9db85d16f8503726d6fd237545e1426e12e4"
  end
  version "3835.0.0"
  license "MIT"
  depends_on "node@16"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
