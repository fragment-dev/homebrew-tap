require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3496.0.0-darwin-x64.tar.gz"
    sha256 "cc470c6849bd5d3c4c05446432562001cfb895c5eb8334829a2916fba2405ebb"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3496.0.0-darwin-arm64.tar.gz"
      sha256 "e08b68146b895b7e9b925b9f2507f131b1194c6766ec08094649665bd7838f17"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3496.0.0-linux-x64.tar.gz"
    sha256 "284b1d8b8e4e1233d1af56c29046c97086c3b90e5b4e788e6c041d43ee197b62"
  end
  version "3496.0.0"
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
