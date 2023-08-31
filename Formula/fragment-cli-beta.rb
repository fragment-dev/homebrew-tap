require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3460.0.0-darwin-x64.tar.gz"
    sha256 "ff616f1098b3836459b22a13be1b64d92b259c272c4de942186376514ef0bf9f"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3460.0.0-darwin-arm64.tar.gz"
      sha256 "bde4ccec6015e5dce96b648d17f510b69ea7b997ee284cce59c382654788b60c"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3460.0.0-linux-x64.tar.gz"
    sha256 "3609da8f929a3e43ef0fbdc5b48579ba94dfab119708b2fd2f0266712ef41dad"
  end
  version "3460.0.0"
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
