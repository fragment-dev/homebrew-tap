require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3783.0.0-darwin-x64.tar.gz"
    sha256 "5201a121128ac7dc76a168af38b406a43c52bd017014491657bca909ea0cc54b"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3783.0.0-darwin-arm64.tar.gz"
      sha256 "1f72a1698e7f5fc5fbeba71353862375c65e449174f6448bed0504a0fffaf058"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3783.0.0-linux-x64.tar.gz"
    sha256 "dc32f6e5ce4533b6dbf863ec5ebbe12378211c9c7062071bdcd544ca8eeef9c3"
  end
  version "3783.0.0"
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
