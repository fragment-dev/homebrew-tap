require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4168.0.0-darwin-x64.tar.gz"
    sha256 "ef219afcdfa1d161f5b20d3790a6dd2ff3458adf5c000e9432d5a2878dd602dd"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4168.0.0-darwin-arm64.tar.gz"
      sha256 "c8d2653209e905560a82c66337dffbb4c341638ba3b69ff7e25ec022063c6d69"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4168.0.0-linux-x64.tar.gz"
    sha256 "d3b809eecadd58bbd582ef0bfdcfa2a67d1406d1583ef460d1e9c36801971961"
  end
  version "4168.0.0"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
