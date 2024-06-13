require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5278.0.0-darwin-x64.tar.gz"
    sha256 "60c3679658e557685fa2f0add93a19d7d57c24ea2a56e1e2a6c65fd6e14d6545"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5278.0.0-darwin-arm64.tar.gz"
      sha256 "4115952e558236e22e9946dc958c019f8dc9be695930c07e343accf433e531f9"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5278.0.0-linux-x64.tar.gz"
    sha256 "4e9821f664d8184daf580fec8f479442ea9841ec6d791b0ca16c6f6f637e55b9"
  end
  version "5278.0.0"
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
