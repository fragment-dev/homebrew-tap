require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5002.0.0-darwin-x64.tar.gz"
    sha256 "bf77c2b4b0b37a4288499bf1e36878ce70a8fb5b65fcce35b08f782ad2031aa1"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5002.0.0-darwin-arm64.tar.gz"
      sha256 "22a32d01fc8a7b42052ae9e127716ea39eb3d3d11d1931e62bc419433dab2918"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5002.0.0-linux-x64.tar.gz"
    sha256 "c959ae0c18b679e81b956be486ef3c1a13b3819f80e21152bdb385fe2fe60440"
  end
  version "5002.0.0"
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
