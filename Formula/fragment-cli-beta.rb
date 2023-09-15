require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3567.0.0-darwin-x64.tar.gz"
    sha256 "8d2084241c2940a47dceabafa5d889f3d5187057a516c102f671af66ff11a2ab"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3567.0.0-darwin-arm64.tar.gz"
      sha256 "49bd9b29d28aed8ff1f129c2b9b3b74f36e087d42c1defa63bfda25b8ecbc969"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3567.0.0-linux-x64.tar.gz"
    sha256 "382303538e25c2e9a6e1c5ae75b8fc2136e9f04efd751d00970a4895bb60a111"
  end
  version "3567.0.0"
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
