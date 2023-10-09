require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3786.0.0-darwin-x64.tar.gz"
    sha256 "27af4b5edb01c5bda49b1b25c7d7541c7323f1e1be79f50b92d075cfca6333ef"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3786.0.0-darwin-arm64.tar.gz"
      sha256 "a8ddce03a727a3b7821aae96aa2cd204ee2ebea59d8649281eae45f5fde02620"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3786.0.0-linux-x64.tar.gz"
    sha256 "cc5a105642894f11f2eb7fce197f65f2a33debc1e184f4dca6171ec04362e32d"
  end
  version "3786.0.0"
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
