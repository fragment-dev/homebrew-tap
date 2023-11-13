require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4002.0.0-darwin-x64.tar.gz"
    sha256 "0bb675305f879e2f29441ddc6149cd47b4d08670a207ab57315e2b4b9fa0c3db"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4002.0.0-darwin-arm64.tar.gz"
      sha256 "9103c649dafddf61dc7511126263187414d72b031a53f97d7e986941f897bfd6"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4002.0.0-linux-x64.tar.gz"
    sha256 "c322b03aeb5c035bd358fd91a8cfaad08e38c0ce1057e7f00053184053e306ba"
  end
  version "4002.0.0"
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
