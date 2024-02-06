require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4505.0.0-darwin-x64.tar.gz"
    sha256 "67e3cd4637243bb89e8437c2553fe8e2a03f9b0d0f7704c63f13d8080a23838d"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4505.0.0-darwin-arm64.tar.gz"
      sha256 "4b3ebe3cd9c0a5f00d1be057afecc864b21e293c1947faf3d9b324a335e78d17"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4505.0.0-linux-x64.tar.gz"
    sha256 "4505f60b403deabb1c9fa86be75a0bbf7a0e6c4cc75783c1fb04629a66e380de"
  end
  version "4505.0.0"
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
