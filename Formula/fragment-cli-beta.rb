require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4383.0.0-darwin-x64.tar.gz"
    sha256 "a0efbbb352436f1f3b031a5a6702afc8fd4ea169c30a43dd7436fce8227b1088"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4383.0.0-darwin-arm64.tar.gz"
      sha256 "386cfb6b77810f6674202b81349cf1ca3f3798343d4c8ca6ce7be0b97a959877"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4383.0.0-linux-x64.tar.gz"
    sha256 "32e4da81550177eb95dc30a6a9e43e94c7b512dd44dc9725b3cc78c7b8f3537b"
  end
  version "4383.0.0"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
