require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5784.0.0-darwin-x64.tar.gz"
    sha256 "ce99a66e2fa03aa2687f9e7038f3acc0253132022ba953c084f0418b2ce5b80c"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5784.0.0-darwin-arm64.tar.gz"
      sha256 "07136c53fc4b6780b78101e2d8a361c1345bae139ef90442031d67ad4d5c56d6"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5784.0.0-linux-x64.tar.gz"
    sha256 "e5cb1b34fb657267ab0978c3e031a16ddf836eeadf11a6650909d287e60f4471"
  end
  version "5784.0.0"
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
