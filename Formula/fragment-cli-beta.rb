require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5194.0.0-darwin-x64.tar.gz"
    sha256 "6100ebbf28cfc5b6e28f6b849b288d4acd2c7c8ee495f082adee700a22a91541"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5194.0.0-darwin-arm64.tar.gz"
      sha256 "4004fac62b77302cc4677edd9a7486a4bdc601d94d1e05988de8233d9b570618"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5194.0.0-linux-x64.tar.gz"
    sha256 "b49f41ec865ac8c1bdaec6f6ea7a8eb336726cd0cb536acdae258650b29ec12a"
  end
  version "5194.0.0"
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
