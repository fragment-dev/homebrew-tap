require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4185.0.0-darwin-x64.tar.gz"
    sha256 "62e681344f8503471da8503852fb027b596b95ff3036a778084103ec357e0a8f"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4185.0.0-darwin-arm64.tar.gz"
      sha256 "36bb03d00e04f6b6be4f2997b9aa9e3febd79165ea6800416e7145e1c75fd699"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4185.0.0-linux-x64.tar.gz"
    sha256 "1ec67fa8396f19266440f06b253e21ab7bd496e05c6d9204574a381b2d61724d"
  end
  version "4185.0.0"
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
