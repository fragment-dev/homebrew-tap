require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4764.0.0-darwin-x64.tar.gz"
    sha256 "71bd8685431f80dafdc57995719a69806ef2f1871cedf090bc63ebdfda81a863"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4764.0.0-darwin-arm64.tar.gz"
      sha256 "c0a746fed0667c6838b2e44b30352a39af533fb01aa5e882c17c1d6d9dfd8e6d"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4764.0.0-linux-x64.tar.gz"
    sha256 "850f5dac02516def808f9d477cc33d76e227f6579e6c405a06dee98468d81ac6"
  end
  version "4764.0.0"
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
