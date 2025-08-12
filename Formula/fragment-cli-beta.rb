require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6945.0.0-darwin-x64.tar.gz"
    sha256 "2baab202de88f88c7dc80b500063d560fcb70ff948eebb2178cca7ab99eefabd"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6945.0.0-darwin-arm64.tar.gz"
      sha256 "cbc877a106ef80077169d5f3ffb8b5309d1ca3eec9b4ab479b25b476142382df"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6945.0.0-linux-x64.tar.gz"
    sha256 "c08e26017a7f7a3b08f99e699c05b5edf38c8de29c6363bccadc34c0651a6edc"
  end
  version "6945.0.0"
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
