require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5904.0.0-darwin-x64.tar.gz"
    sha256 "771b96d03087280d547541c6eae6feb329ca09b14f6c914108bbd2398ca3db67"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5904.0.0-darwin-arm64.tar.gz"
      sha256 "fe686b916d5c00449ebccd93d38974ea16397f539e1c70ae8c34daf6ae96ff1a"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5904.0.0-linux-x64.tar.gz"
    sha256 "8c451844ccc557c48f5f85064aaca8e0e0605697a75cf5e94de2b0e906161025"
  end
  version "5904.0.0"
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
