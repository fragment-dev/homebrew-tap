require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4670.0.0-darwin-x64.tar.gz"
    sha256 "de4e5584f9b02acdb98050ab346859786d767de2e6574ad9d856d9bef177e68c"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4670.0.0-darwin-arm64.tar.gz"
      sha256 "325f55c3b508c9648b907c2d71cfe1fc0616ed417daa087016afab106ee439f1"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4670.0.0-linux-x64.tar.gz"
    sha256 "7d23f44f038e2c22d67b54194cb34a34255c7d59ccea9e0f12e9e165f17a6a23"
  end
  version "4670.0.0"
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
