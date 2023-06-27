require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2942.0.0-darwin-x64.tar.gz"
    sha256 "8b6d8ed53d1859dfd3e274bdf780fccb65192f408878d7829d82f6ef74831d68"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2942.0.0-darwin-arm64.tar.gz"
      sha256 "0417beab2ca809381b53be0f4d371bdb978fb13c8530ddb919a5bf56dd5ec2d2"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2942.0.0-linux-x64.tar.gz"
    sha256 "2d72ef785745fe42fc7c67a0863279ea05f1a5858200f736995690771ad8bfd7"
  end
  version "2942.0.0"
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
