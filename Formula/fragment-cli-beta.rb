require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4641.0.0-darwin-x64.tar.gz"
    sha256 "b702efbed2519ae5cbec204acc50b9ed5ddc7b1c66c8e9069a67e59d6887405e"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4641.0.0-darwin-arm64.tar.gz"
      sha256 "15c4bcc18800f23623a668ed739fc7df26f5ba7cc9e8697fbcefd21751e7055a"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4641.0.0-linux-x64.tar.gz"
    sha256 "9d1e8031edbb6f5cf40ffaf422f0b762f9d19ded7d63ffde6a525280351d1d53"
  end
  version "4641.0.0"
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
