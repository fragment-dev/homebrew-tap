require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4757.0.0-darwin-x64.tar.gz"
    sha256 "43d0c8185217073d00d268c4f1c698eaf96ffa9f1e0ee5981d28023b1f475176"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4757.0.0-darwin-arm64.tar.gz"
      sha256 "ea49c4bf739d6a21b3aa2e7e05817c472bb674192288538ae3221597028912f0"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4757.0.0-linux-x64.tar.gz"
    sha256 "92b39d7c3999f3ce53f61c08817e9648f3f3083b7ed1c221a346010535ba42b3"
  end
  version "4757.0.0"
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
