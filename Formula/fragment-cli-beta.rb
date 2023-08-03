require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3224.0.0-darwin-x64.tar.gz"
    sha256 "2f15e7d28568a522351ad4ef246a41e94d2421a963bc99cb376a21c6905bab75"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3224.0.0-darwin-arm64.tar.gz"
      sha256 "f7448bf01047fbcaa165ea8e93129ca407cea5ae7fbbcd6b562a01c0dff226c0"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3224.0.0-linux-x64.tar.gz"
    sha256 "d0b2f5c6fca355aaeb7e819c43124546a4c201c5c4a81992a2248b61b264e9b0"
  end
  version "3224.0.0"
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
