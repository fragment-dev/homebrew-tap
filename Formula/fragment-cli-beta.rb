require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2661.0.0-darwin-x64.tar.gz"
    sha256 "abe7c4610823bcde968cc531008443b5607a249899a6cec6513147d58fd57940"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2661.0.0-darwin-arm64.tar.gz"
      sha256 "334db96e82f74572af0fe998a9afb14fad85b9633fd8b5531c0b50c428f05a88"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2661.0.0-linux-x64.tar.gz"
    sha256 "f31843be394c678b109e0ae81697bfa819649e105d9a6d484a87c98c462e4022"
  end
  version "2661.0.0"
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
