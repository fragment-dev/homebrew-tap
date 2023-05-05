require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2593.0.0-darwin-x64.tar.gz"
    sha256 "94a8d06b3d74e5faa0d8f92b04e82d00a54bedc900c8f1fa363da9c5d20c59be"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2593.0.0-darwin-arm64.tar.gz"
      sha256 "5ca6917add5969ecdcf332cf52cd477c034678b2472bf32c38316d22e6cb37c1"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2593.0.0-linux-x64.tar.gz"
    sha256 "84a5324a19c45c8c4b00c367e4afd6787a783ddb2c583520a19ebc9b991eb1c9"
  end
  version "2593.0.0"
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
