require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3164.0.0-darwin-x64.tar.gz"
    sha256 "c5d04a985ec95494fe2f7f3991ee4a7a19fe286fe626d55c9f207154b0ac1c7e"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3164.0.0-darwin-arm64.tar.gz"
      sha256 "5d5aded694b02058d3e11b299b9e96c0bf66993f17cb12000322f7cd0472319e"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3164.0.0-linux-x64.tar.gz"
    sha256 "f1454d8a3cfb38ae16fc401bdb479c0eb9eb2a151c3e2cc1f672adac6b324cca"
  end
  version "3164.0.0"
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
