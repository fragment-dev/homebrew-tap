require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5546.0.0-darwin-x64.tar.gz"
    sha256 "a3c0c3d18d0510f585b1c5b94f01c056e128149aab3e1acb175d103b5c27524e"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5546.0.0-darwin-arm64.tar.gz"
      sha256 "737d159ca4643e6f88be7886b8d8de8ad42bf0d11c31ea294c5c51a916c7482a"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5546.0.0-linux-x64.tar.gz"
    sha256 "11664b344473d5ef42e0b538e2b6a72179d8eeaa151e38d06255d81bb2f0f192"
  end
  version "5546.0.0"
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
