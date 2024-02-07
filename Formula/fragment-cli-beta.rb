require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4511.0.0-darwin-x64.tar.gz"
    sha256 "8c06ee30c857fad4047338807e1f36b17c9c6e833fa0d014e7a90fb9716e22d2"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4511.0.0-darwin-arm64.tar.gz"
      sha256 "93318772af395144469f42f04d535d64cf6b84472fd61f5a0ada1a9b5069e69f"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4511.0.0-linux-x64.tar.gz"
    sha256 "9c69ff07d305eecac32f94f404e718838d1da55393a9764326bb1f37a3711a33"
  end
  version "4511.0.0"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
