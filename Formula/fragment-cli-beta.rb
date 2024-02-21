require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4610.0.0-darwin-x64.tar.gz"
    sha256 "96aebb50de44e74d18f104ce8acc58a92145298ec1f26823a44b363fd3568060"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4610.0.0-darwin-arm64.tar.gz"
      sha256 "b182048f6ff23c716572505ef00a168fa44195baa608756244d3a1a1a4bef260"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4610.0.0-linux-x64.tar.gz"
    sha256 "e483b8a9b79e439f661e00c19e635239acb3ef305aa1244ec6b4af227c523265"
  end
  version "4610.0.0"
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
