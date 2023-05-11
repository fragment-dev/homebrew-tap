require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2632.0.0-darwin-x64.tar.gz"
    sha256 "7907b330d6063342181445685ba66f4bc833a82df5aaab6d506f2ff3b03d659b"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2632.0.0-darwin-arm64.tar.gz"
      sha256 "334d01e27307a9ff3794afb1fbf119a18ea69aeae6b9a6ea5a6c913baf466c34"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2632.0.0-linux-x64.tar.gz"
    sha256 "a6fff07f7143485991b3c8af0a66956625548a39306bd96e3b72c43dfd7c59fb"
  end
  version "2632.0.0"
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
