require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3345.0.0-darwin-x64.tar.gz"
    sha256 "b3b6dceb3d2f6b428afffbed25c8ad220b0d55f6c974ca180622783a3ab99dcc"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3345.0.0-darwin-arm64.tar.gz"
      sha256 "a25a011def703316b8cb540af15ebd32f4bc0f5c00e9e7cd68fc5cb939875334"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3345.0.0-linux-x64.tar.gz"
    sha256 "b38f179c6352cdd96af7b52990c61404a3915f7634fcefb5d242290faa9173ae"
  end
  version "3345.0.0"
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
