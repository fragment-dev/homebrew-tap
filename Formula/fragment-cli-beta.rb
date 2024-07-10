require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5378.0.0-darwin-x64.tar.gz"
    sha256 "15962da7c17cece3d87abc0b6c342fda68980e39548b6b5e2e6ec676cf7e78f7"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5378.0.0-darwin-arm64.tar.gz"
      sha256 "44fcacfa95d87285906d58fa5915961654574ec62a3ebffccb455b2f8f55675c"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5378.0.0-linux-x64.tar.gz"
    sha256 "f02d17bcf818191baa634e96a850fb61937dd4336ff0d3c23cab09066f17b843"
  end
  version "5378.0.0"
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
