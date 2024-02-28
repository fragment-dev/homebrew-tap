require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4661.0.0-darwin-x64.tar.gz"
    sha256 "54b9d0dc25d033a22a01d37627f2531dc67c42f819f8c1ea3a781f464d1e1aeb"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4661.0.0-darwin-arm64.tar.gz"
      sha256 "3706b071ff7db9b7fcc16ba857f8f17b37ec0bf5e483e21185d309ebfb997244"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4661.0.0-linux-x64.tar.gz"
    sha256 "b2de25a8627e56ee9289c6b296cde6b9a10b4c700626f007cea00a0d1197539b"
  end
  version "4661.0.0"
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
