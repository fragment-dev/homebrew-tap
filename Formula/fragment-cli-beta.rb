require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5728.0.0-darwin-x64.tar.gz"
    sha256 "58298617d396d3fa4a2c0eb42f9e711db79b4f26db143352ddf79ad7cd294b1c"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5728.0.0-darwin-arm64.tar.gz"
      sha256 "2b93304319f09f2ca7747e647ef6b750b124ef06916fd3057331cd17359cf76c"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5728.0.0-linux-x64.tar.gz"
    sha256 "ac1811663ef76cc0c9fdf1365ab55f3e7fa6420010fc6e6eb5c2e9d5977eed81"
  end
  version "5728.0.0"
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
