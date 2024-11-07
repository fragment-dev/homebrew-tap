require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5744.0.0-darwin-x64.tar.gz"
    sha256 "de87284abaa53a3384466d3767bfa82a88cf7467b98b6bcd5db3c8ae7810e79f"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5744.0.0-darwin-arm64.tar.gz"
      sha256 "0d5a01ef7dcc7649a1933bbd2b83023df7f2768daf1ec6d505ea33131d13cc4c"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5744.0.0-linux-x64.tar.gz"
    sha256 "ea42a7413ddf66ebf3ef8adc86fb465478a6497a8ea4cb3beddb6262bf6ac8d7"
  end
  version "5744.0.0"
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
