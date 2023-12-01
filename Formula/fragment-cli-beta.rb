require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4080.0.0-darwin-x64.tar.gz"
    sha256 "e60b8341fd4becb18c744fd95097da14909b9d72adb0e9aded35a1c32d6edb41"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4080.0.0-darwin-arm64.tar.gz"
      sha256 "d131ab224d92850d9ead4d3943e3cc41f9e9544ca71de6eeb9b5ed237e09463b"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4080.0.0-linux-x64.tar.gz"
    sha256 "96218e11a4d20ece6845dfd08486dae2d2aa4127bef01665be5a1c77d6ba56fe"
  end
  version "4080.0.0"
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
