require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4924.0.0-darwin-x64.tar.gz"
    sha256 "81273dca533b98ef0ed1d3f468466ba5db865c19548b29ad24d75b5b68d307c7"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4924.0.0-darwin-arm64.tar.gz"
      sha256 "ac6114834db8f89babe326000e3264174a234ce6a5b819c7d85dae9a85d6411f"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4924.0.0-linux-x64.tar.gz"
    sha256 "bc7eb2bb6c9d3d92a914225e424ebf4ec90f27cfea53effffd3c599869331fa0"
  end
  version "4924.0.0"
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
