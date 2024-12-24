require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5978.0.0-darwin-x64.tar.gz"
    sha256 "ec278b29ce549398cd17a084334aa43989bb16cb98fb70f57d4a72fe0030687c"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5978.0.0-darwin-arm64.tar.gz"
      sha256 "b91659a27b2f022872a364de2fac882331e9e6e0d4a4c18ed0859bdc4181faeb"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5978.0.0-linux-x64.tar.gz"
    sha256 "aeab0850e06c22b7f51a238949e91dee8b97f0b9d568a3645687be2576ad7481"
  end
  version "5978.0.0"
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
