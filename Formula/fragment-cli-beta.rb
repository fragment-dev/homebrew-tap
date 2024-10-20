require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5680.0.0-darwin-x64.tar.gz"
    sha256 "c0e45f74c189f2ece42934ba5ee32fd99d8900e16a500e13599043e9de1590ad"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5680.0.0-darwin-arm64.tar.gz"
      sha256 "740e2d265587235c53b258bf69c26b3d9f42397a62f1da689cb95b5b65755d51"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5680.0.0-linux-x64.tar.gz"
    sha256 "00364c53a2023f6cc6d1ec95b81d960e3d255fe81dca08fa024340420c82c3f9"
  end
  version "5680.0.0"
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
