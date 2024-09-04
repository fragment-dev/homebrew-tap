require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5561.0.0-darwin-x64.tar.gz"
    sha256 "f51972d7869bda38c95b02cda4abe58d4cfdd372d52c74d4ffdf45421f1796b0"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5561.0.0-darwin-arm64.tar.gz"
      sha256 "3129442875acceaf54e4b2b9b9c98eeef159f2d8d4982a8601497edf64b6ae28"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5561.0.0-linux-x64.tar.gz"
    sha256 "0abbe529fb4e683dbc55721face86b8849ec8e8f2ad1b375b33f99b6cf9ab0dd"
  end
  version "5561.0.0"
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
