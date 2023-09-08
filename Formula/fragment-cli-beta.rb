require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3511.0.0-darwin-x64.tar.gz"
    sha256 "7889ffc3aece217ea666c48640b2d818d5bb76031402bfcef38c8420c1a852aa"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3511.0.0-darwin-arm64.tar.gz"
      sha256 "dcceac70dc6bc3ababf48ce015f7c39bb018d0699b3be9f7fdd012ece7b376c9"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3511.0.0-linux-x64.tar.gz"
    sha256 "81ad83d1e1b765a27a4828586d4e02b6c30badf83dd3768a93fab4479b991e3d"
  end
  version "3511.0.0"
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
