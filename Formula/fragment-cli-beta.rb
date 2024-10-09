require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5655.0.0-darwin-x64.tar.gz"
    sha256 "7e53b73550f611b2e8054c2d1e4b7986a5a2f72b9347c60c96080162a46571f8"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5655.0.0-darwin-arm64.tar.gz"
      sha256 "6a13774e23b663058927360605f2c5818b18809fe6e962007d7dd08b2375d5a5"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5655.0.0-linux-x64.tar.gz"
    sha256 "b70ab4770129fca83615af15c3bf8a42568cab1635fea840e7ea6d438900279b"
  end
  version "5655.0.0"
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
