require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5427.0.0-darwin-x64.tar.gz"
    sha256 "0a5112f7ca1e03ef97f80fcd3e6a62399900869fdb77e34b2aa68b5d0270bd3b"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5427.0.0-darwin-arm64.tar.gz"
      sha256 "d82d1026896da7653a3d26a349405fada5d57acb287c7a7d94cfd5a7f2079322"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5427.0.0-linux-x64.tar.gz"
    sha256 "ebefcfd1b86f2316094a0721401ab87d7a26bb0131e4e5b89f519346826ac48d"
  end
  version "5427.0.0"
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
