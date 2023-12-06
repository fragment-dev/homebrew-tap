require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4098.0.0-darwin-x64.tar.gz"
    sha256 "897f1a02d96cff362f741bb7de2783d6aa6d1dc59363c7a9fbeab4a55b6a63f7"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4098.0.0-darwin-arm64.tar.gz"
      sha256 "f35b46c4dc14cdb994deb5bdd854596ada6e74bdd4a9034aa77fb1ca4caa22b1"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4098.0.0-linux-x64.tar.gz"
    sha256 "fc1e5edc99a6ac16f26dbb2b554aa8a9b8a5743e367ac80a6aeb5c8221adf79a"
  end
  version "4098.0.0"
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
