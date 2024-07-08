require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5357.0.0-darwin-x64.tar.gz"
    sha256 "bd8c905db4bc170ca30f6273cff8fcbfa7d435720b3d4f8880d094ac1ae38c89"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5357.0.0-darwin-arm64.tar.gz"
      sha256 "6d160e9ec8ea5081fafc8da6dc949293faa4914c23cde4ba639e0c2f15bd025b"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5357.0.0-linux-x64.tar.gz"
    sha256 "df2901a01b5a925bff9ebf39ca9170a9f38c5c6a25a22db4bff45ca1a8d0aec5"
  end
  version "5357.0.0"
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
