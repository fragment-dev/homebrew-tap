require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2391.0.0-darwin-x64.tar.gz"
    sha256 "4b05af1519f3179920e2195ce4a9455d3d83a162cb1cf5aeb6f69d07e979417e"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2391.0.0-darwin-arm64.tar.gz"
      sha256 "79a83bed3ce31f768f195f032c6cf9c7f8763cff28665f89300d2590e1bdd3ea"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2391.0.0-linux-x64.tar.gz"
    sha256 "83ec7d3fbc99b1464816933dd092e0b0ff1b75f9e75c6db5ae8c33d46b10e332"
  end
  version "2391.0.0"
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
