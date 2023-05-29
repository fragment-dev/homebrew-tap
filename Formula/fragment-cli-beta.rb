require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2756.0.0-darwin-x64.tar.gz"
    sha256 "e9f495a41805c862210e78bbe49cfccbc98cfcd8c4be41930b4027026f9a976f"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2756.0.0-darwin-arm64.tar.gz"
      sha256 "17830c4f6f334d4101565e9e73d74d6b744144b796ab5c3ff5f7b0c158643021"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2756.0.0-linux-x64.tar.gz"
    sha256 "2d33cdc8913026c59025bec43972ff0436f4d4fe2d67b8df05750a4e2353fea6"
  end
  version "2756.0.0"
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
