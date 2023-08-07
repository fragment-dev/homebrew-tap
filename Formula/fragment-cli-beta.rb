require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3252.0.0-darwin-x64.tar.gz"
    sha256 "ae436bb492890313e7612ffbb8b4d612bf8d50aaf0585dec8a92bd83ab85282b"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3252.0.0-darwin-arm64.tar.gz"
      sha256 "f0da33d529249583c320b4a71188cf7b2942c1f04f40fb010d42b0c0639f834f"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3252.0.0-linux-x64.tar.gz"
    sha256 "5b0db2a7f5e20715cc3cd71aceccc26b9e8b6e7a204b053985fb643c35254eab"
  end
  version "3252.0.0"
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
