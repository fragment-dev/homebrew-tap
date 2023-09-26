require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3666.0.0-darwin-x64.tar.gz"
    sha256 "8d10364c6bee5f90ee1d9eee381db34bb36d89fb0f5412703196f21a69eb4385"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3666.0.0-darwin-arm64.tar.gz"
      sha256 "87d0161be0dc6fb8a3a3adba234db59f3ca00d673c51235c827e8870b8e9feb6"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3666.0.0-linux-x64.tar.gz"
    sha256 "411b6a2b7ccb6e1bc02525cee4ed40fd318390314bdb2f43e8d60a3d75be28e1"
  end
  version "3666.0.0"
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
